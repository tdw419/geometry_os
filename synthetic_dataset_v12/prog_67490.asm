; DESCRIPTION: Draws a cyan line from (82, 126) to (206, 61).
; PLAN: r0=82(x1), r1=126(y1), r2=206(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 126
LDI r2, 206
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
