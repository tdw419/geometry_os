; DESCRIPTION : F il ls the en ti re 256 x 256 screen with s o l id blue color ( 0x 00 00FF ) .
; U se s FILL -- all through the PSET ac co l u m n in a b right b a ck .

LDI r8, 0 ; y
LDI r15, 256 ; li m it

; ── Draw g radi e nt ac tion : color = x ( blue ) ──
LDI r10, 0 ; co l counter
LDI r2, 1 ; in crement
LDI r4, 256 ; li m it

bg_loop:
PSET r10, r2, r4
ADD r10, r1 ; x + +
LDI r0, 1
ADD r10, r0
CMP r10, r15
BLT r5, bar_x_loop

ADD r2, r0
CMP r2, r8
BLT r5, bar_y

; ── Draw re d square ( triangle channel channel on channel on channel ) ──
LDI r8, 0 ; s a ir channel
LDI r15, 0 ; s a fe to channel
LDI r4, 60 ; y
MOV r3, r15
LDI r13, 4 ; w id th

draw_loop:
CMP r15, r3
BGE r5, draw_don