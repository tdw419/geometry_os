; DESCRIPTION: Places a white 38x81 rectangle at position (181, 91).
; PLAN: r0=181(x), r1=91(y), r2=38(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 91
LDI r2, 38
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
