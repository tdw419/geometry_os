; DESCRIPTION: Renders a cyan box of size 95x14 starting at (46, 215).
; PLAN: r0=46(x), r1=215(y), r2=95(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 215
LDI r2, 95
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
