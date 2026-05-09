; DESCRIPTION: Places a black 101x45 rectangle at position (154, 95).
; PLAN: r0=154(x), r1=95(y), r2=101(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 95
LDI r2, 101
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
