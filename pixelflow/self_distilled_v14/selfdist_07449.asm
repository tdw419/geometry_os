; DESCRIPTION: Renders a cyan line segment connecting (279, 14) to (360, 143).
; PLAN: r0=279(x1), r1=14(y1), r2=360(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 14
LDI r2, 360
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
