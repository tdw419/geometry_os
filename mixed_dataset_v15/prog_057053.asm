; DESCRIPTION: Places a yellow 10x50 rectangle at position (60, 194).
; PLAN: r0=60(x), r1=194(y), r2=10(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 194
LDI r2, 10
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
