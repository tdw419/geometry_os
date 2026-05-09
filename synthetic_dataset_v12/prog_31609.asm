; DESCRIPTION: Places a orange 48x47 rectangle at position (77, 182).
; PLAN: r0=77(x), r1=182(y), r2=48(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 182
LDI r2, 48
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
