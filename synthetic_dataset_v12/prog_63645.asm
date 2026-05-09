; DESCRIPTION: Draws a white line from (146, 215) to (246, 128).
; PLAN: r0=146(x1), r1=215(y1), r2=246(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 215
LDI r2, 246
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
