; DESCRIPTION: Renders a cyan box of size 102x103 starting at (173, 12).
; PLAN: r0=173(x), r1=12(y), r2=102(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 12
LDI r2, 102
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
