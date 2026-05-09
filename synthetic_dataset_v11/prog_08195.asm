; DESCRIPTION: Places a green 98x49 rectangle at position (154, 10).
; PLAN: r0=154(x), r1=10(y), r2=98(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 10
LDI r2, 98
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
