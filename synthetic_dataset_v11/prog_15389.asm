; DESCRIPTION: Places a cyan 50x10 rectangle at position (95, 88).
; PLAN: r0=95(x), r1=88(y), r2=50(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 88
LDI r2, 50
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
