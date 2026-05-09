; DESCRIPTION: Places a white 98x50 rectangle at position (53, 144).
; PLAN: r0=53(x), r1=144(y), r2=98(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 144
LDI r2, 98
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
