; DESCRIPTION: Places a green 42x44 rectangle at position (169, 7).
; PLAN: r0=169(x), r1=7(y), r2=42(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 7
LDI r2, 42
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
