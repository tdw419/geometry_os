; DESCRIPTION: Draws a cyan line from (182, 42) to (32, 38).
; PLAN: r0=182(x1), r1=42(y1), r2=32(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 42
LDI r2, 32
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
