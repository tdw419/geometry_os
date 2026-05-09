; DESCRIPTION: Fills the entire 256x256 screen with solid blue color (0x0000FF).
; PLAN: r0=0(x), r1=107(y), r2=70(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 17
LDI r2, 60
LDI r3, 18
LDI r4, 0xF00000
RECTF r0, r1, r2, r3, r4
HALT