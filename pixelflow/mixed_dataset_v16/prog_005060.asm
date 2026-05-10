; DESCRIPTION: Renders a cyan box of size 47x95 starting at (173, 21).
; PLAN: r0=173(x), r1=21(y), r2=47(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 21
LDI r2, 47
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
