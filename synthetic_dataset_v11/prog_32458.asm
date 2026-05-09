; DESCRIPTION: Places a white 119x46 rectangle at position (60, 95).
; PLAN: r0=60(x), r1=95(y), r2=119(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 95
LDI r2, 119
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
