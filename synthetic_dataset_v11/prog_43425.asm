; DESCRIPTION: Places a white 55x102 rectangle at position (171, 7).
; PLAN: r0=171(x), r1=7(y), r2=55(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 7
LDI r2, 55
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
