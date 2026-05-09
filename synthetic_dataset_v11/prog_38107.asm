; DESCRIPTION: Places a red 120x71 rectangle at position (135, 62).
; PLAN: r0=135(x), r1=62(y), r2=120(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 62
LDI r2, 120
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
