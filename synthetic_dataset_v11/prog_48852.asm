; DESCRIPTION: Draws a cyan line from (82, 249) to (128, 113).
; PLAN: r0=82(x1), r1=249(y1), r2=128(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 249
LDI r2, 128
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
