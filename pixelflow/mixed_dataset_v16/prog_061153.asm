; DESCRIPTION: Places a red 55x102 rectangle at position (206, 109).
; PLAN: r0=206(x), r1=109(y), r2=55(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 109
LDI r2, 55
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
