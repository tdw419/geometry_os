; DESCRIPTION: Renders a cyan line between points (260, 10) and (301, 42).
; PLAN: r0=260(x1), r1=10(y1), r2=301(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 10
LDI r2, 301
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
