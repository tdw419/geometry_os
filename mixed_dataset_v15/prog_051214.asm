; DESCRIPTION: Renders a cyan line segment connecting (146, 50) to (85, 111).
; PLAN: r0=146(x1), r1=50(y1), r2=85(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 50
LDI r2, 85
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
