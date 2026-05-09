; DESCRIPTION: Draws a cyan line from (56, 82) to (271, 50).
; PLAN: r0=56(x1), r1=82(y1), r2=271(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 82
LDI r2, 271
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
