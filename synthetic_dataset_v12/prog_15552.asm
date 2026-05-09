; DESCRIPTION: Places a red 82x26 rectangle at position (154, 129).
; PLAN: r0=154(x), r1=129(y), r2=82(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 129
LDI r2, 82
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
