; DESCRIPTION: Places a white 30x102 rectangle at position (186, 5).
; PLAN: r0=186(x), r1=5(y), r2=30(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 5
LDI r2, 30
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
