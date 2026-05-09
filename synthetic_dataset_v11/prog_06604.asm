; DESCRIPTION: Renders a cyan box of size 59x92 starting at (173, 42).
; PLAN: r0=173(x), r1=42(y), r2=59(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 42
LDI r2, 59
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
