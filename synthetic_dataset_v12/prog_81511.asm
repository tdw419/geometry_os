; DESCRIPTION: Places a red 59x109 rectangle at position (160, 133).
; PLAN: r0=160(x), r1=133(y), r2=59(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 133
LDI r2, 59
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
