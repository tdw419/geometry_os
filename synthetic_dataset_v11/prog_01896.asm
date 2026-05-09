; DESCRIPTION: Places a white 69x61 rectangle at position (186, 57).
; PLAN: r0=186(x), r1=57(y), r2=69(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 57
LDI r2, 69
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
