; DESCRIPTION: Places a green 50x34 box at position (154, 168).
; PLAN: r0=154(x), r1=168(y), r2=50(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 168
LDI r2, 50
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
