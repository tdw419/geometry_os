; DESCRIPTION: Renders a cyan line segment connecting (198, 42) to (323, 95).
; PLAN: r0=198(x1), r1=42(y1), r2=323(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 42
LDI r2, 323
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
