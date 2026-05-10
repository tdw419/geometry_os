; DESCRIPTION: Places a white 111x102 rectangle at position (295, 67).
; PLAN: r0=295(x), r1=67(y), r2=111(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 67
LDI r2, 111
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
