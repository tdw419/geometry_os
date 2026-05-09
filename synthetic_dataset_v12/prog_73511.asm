; DESCRIPTION: Places a red 91x50 rectangle at position (12, 28).
; PLAN: r0=12(x), r1=28(y), r2=91(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 28
LDI r2, 91
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
