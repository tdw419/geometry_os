; DESCRIPTION: Places a red 38x100 rectangle at position (204, 21).
; PLAN: r0=204(x), r1=21(y), r2=38(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 21
LDI r2, 38
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
