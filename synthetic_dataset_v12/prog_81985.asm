; DESCRIPTION: Draws a red line from (126, 27) to (76, 215).
; PLAN: r0=126(x1), r1=27(y1), r2=76(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 27
LDI r2, 76
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
