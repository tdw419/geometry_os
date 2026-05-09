; DESCRIPTION: Places a white 113x80 rectangle at position (232, 174).
; PLAN: r0=232(x), r1=174(y), r2=113(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 174
LDI r2, 113
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
