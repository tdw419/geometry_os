; DESCRIPTION: Renders a cyan line between points (329, 224) and (103, 172).
; PLAN: r0=329(x1), r1=224(y1), r2=103(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 224
LDI r2, 103
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
