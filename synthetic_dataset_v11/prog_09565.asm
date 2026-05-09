; DESCRIPTION: Places a white 40x76 rectangle at position (197, 95).
; PLAN: r0=197(x), r1=95(y), r2=40(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 95
LDI r2, 40
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
