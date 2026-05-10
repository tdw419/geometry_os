; DESCRIPTION: Places a white 50x120 rectangle at position (455, 38).
; PLAN: r0=455(x), r1=38(y), r2=50(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 38
LDI r2, 50
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
