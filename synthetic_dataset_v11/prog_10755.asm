; DESCRIPTION: Draws a green line from (16, 42) to (32, 154).
; PLAN: r0=16(x1), r1=42(y1), r2=32(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 42
LDI r2, 32
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
