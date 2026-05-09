; DESCRIPTION: Places a white 113x25 rectangle at position (38, 106).
; PLAN: r0=38(x), r1=106(y), r2=113(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 106
LDI r2, 113
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
