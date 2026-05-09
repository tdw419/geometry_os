; DESCRIPTION: Places a white 18x120 rectangle at position (105, 50).
; PLAN: r0=105(x), r1=50(y), r2=18(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 50
LDI r2, 18
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
