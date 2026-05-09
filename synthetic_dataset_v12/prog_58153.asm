; DESCRIPTION: Places a white 30x107 rectangle at position (144, 143).
; PLAN: r0=144(x), r1=143(y), r2=30(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 143
LDI r2, 30
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
