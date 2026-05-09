; DESCRIPTION: Places a white 80x20 rectangle at position (146, 36).
; PLAN: r0=146(x), r1=36(y), r2=80(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 36
LDI r2, 80
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
