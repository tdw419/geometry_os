; DESCRIPTION: Places a orange 103x38 rectangle at position (71, 180).
; PLAN: r0=71(x), r1=180(y), r2=103(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 180
LDI r2, 103
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
