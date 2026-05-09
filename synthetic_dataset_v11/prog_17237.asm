; DESCRIPTION: Places a white 54x80 rectangle at position (171, 98).
; PLAN: r0=171(x), r1=98(y), r2=54(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 98
LDI r2, 54
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
