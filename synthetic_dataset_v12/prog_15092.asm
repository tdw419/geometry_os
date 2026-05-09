; DESCRIPTION: Draws a cyan line from (402, 42) to (236, 16).
; PLAN: r0=402(x1), r1=42(y1), r2=236(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 42
LDI r2, 236
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
