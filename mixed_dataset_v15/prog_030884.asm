; DESCRIPTION: Fills the screen with a vertical red gradient from dark to bright.
; PLAN: r0=CMP flag (readonly), r1=0(y), r2=0(x), r3=512(width), r4=256(height), r7=0xFF0000(color). CMP stores result in r0.
LDI r7, 0xFF0000
LDI r1, 0
JNZ r1, 0
LDI r2, 0
LDI r3, 0
JNZ r1, looop_ppp_lo
LDI r5, 1
ADD r2, r5
LDI r6, 512
CMP r2, r6
BLT r0, x_loop
LDI r5, 1
LDI r6, 256
CMP r1, r6
BLT r0, y_loop
HALT
