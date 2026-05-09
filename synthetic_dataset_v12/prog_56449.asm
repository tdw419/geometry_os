; DESCRIPTION: Places a cyan 17x90 rectangle at position (214, 92).
; PLAN: r0=214(x), r1=92(y), r2=17(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 92
LDI r2, 17
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
