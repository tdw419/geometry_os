; DESCRIPTION: Renders a cyan line between points (383, 82) and (164, 255).
; PLAN: r0=383(x1), r1=82(y1), r2=164(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 82
LDI r2, 164
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
