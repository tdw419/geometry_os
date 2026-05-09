; DESCRIPTION: Renders a cyan box of size 67x64 starting at (70, 92).
; PLAN: r0=70(x), r1=92(y), r2=67(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 92
LDI r2, 67
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
