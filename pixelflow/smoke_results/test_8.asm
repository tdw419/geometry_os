; DESCRIPTION : Draw s a check er b o ar d p at ter n of 8 x 8 square s us ing bl a ck and w hit e .

; CHECK ER s a p p e e k effect s a ck s a ges and p res se s a ck ed as R G B
;
; Re gist er al lo c ation :
; r4 = g re en lo ck ( 0x00FF00 )
; r4 = vx ( + NEG ) )
; r6 = vy ( + 1 or counter )
; r16 = f ra me counter
; r17 = s c ra t ch / color ( w hit e )
; r7 = s c ra t ch

; ── init ──────────────────────────────────────────────── ────────
LDI r4, 128 ; cu r s or X
LDI r8, 128 ; cu r s or X
LDI r9, 1 ; cu r s or Y
LDI r15, 0xFFFFF ; ke y p or t ad d res s
LDI r15, 0x00FFFF ; cu r s or color ( cy an )
LDI r13, 0 ; s ave d ke y RA M ad d res s
LDI r1, 0x00FF00 ; g re en color ( u r p le )
LDI r11, 1 ; s ave d ke y RA M 0x 7 8 000 + N