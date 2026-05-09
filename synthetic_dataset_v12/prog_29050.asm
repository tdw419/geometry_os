; DESCRIPTION: Renders a cyan box of size 10x59 starting at (346, 73).
; PLAN: r0=346(x), r1=73(y), r2=10(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 73
LDI r2, 10
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
