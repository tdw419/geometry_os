; DESCRIPTION: Places a cyan 36x95 rectangle at position (214, 148).
; PLAN: r0=214(x), r1=148(y), r2=36(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 148
LDI r2, 36
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
