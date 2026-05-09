; DESCRIPTION: Renders a cyan line between points (426, 196) and (436, 213).
; PLAN: r0=426(x1), r1=196(y1), r2=436(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 196
LDI r2, 436
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
