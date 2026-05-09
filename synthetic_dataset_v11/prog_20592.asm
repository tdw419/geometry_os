; DESCRIPTION: Places a cyan 62x11 rectangle at position (92, 27).
; PLAN: r0=92(x), r1=27(y), r2=62(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 27
LDI r2, 62
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
