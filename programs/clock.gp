# clock.gp -- Analog clock face showing 10:10:30
# Hour markers at radius 80, center (128, 128)
# Minute hand at 10 min (2 o'clock), radius 60
# Hour hand at 10 hours (10 o'clock), radius 45
# Second hand at 30 sec (6 o'clock), radius 80

# === Hour markers (12 positions) ===
pixel(128, 48, 0x44)
pixel(168, 59, 0x44)
pixel(197, 88, 0x44)
pixel(208, 128, 0x44)
pixel(197, 168, 0x44)
pixel(168, 197, 0x44)
pixel(128, 208, 0x44)
pixel(88, 197, 0x44)
pixel(59, 168, 0x44)
pixel(48, 128, 0x44)
pixel(59, 88, 0x44)
pixel(88, 59, 0x44)

# === Second hand (30 sec = 6 o'clock, straight down) ===
pixel(128, 133, 0xFF)
pixel(128, 138, 0xFF)
pixel(128, 143, 0xFF)
pixel(128, 148, 0xFF)
pixel(128, 153, 0xFF)
pixel(128, 158, 0xFF)
pixel(128, 163, 0xFF)
pixel(128, 168, 0xFF)
pixel(128, 173, 0xFF)
pixel(128, 178, 0xFF)
pixel(128, 183, 0xFF)
pixel(128, 188, 0xFF)
pixel(128, 193, 0xFF)
pixel(128, 198, 0xFF)
pixel(128, 203, 0xFF)
pixel(128, 208, 0xFF)

# === Minute hand (10 min = 2 o'clock, 60 deg from 12) ===
pixel(132, 126, 0x41)
pixel(136, 123, 0x41)
pixel(140, 121, 0x41)
pixel(144, 119, 0x41)
pixel(148, 116, 0x41)
pixel(152, 114, 0x41)
pixel(156, 112, 0x41)
pixel(160, 110, 0x41)
pixel(164, 107, 0x41)
pixel(168, 105, 0x41)
pixel(172, 103, 0x41)
pixel(176, 100, 0x41)
pixel(180, 98, 0x41)

# === Hour hand (10 hours = 10 o'clock, 300 deg from 12) ===
pixel(124, 126, 0xE0)
pixel(120, 123, 0xE0)
pixel(116, 121, 0xE0)
pixel(112, 119, 0xE0)
pixel(108, 117, 0xE0)
pixel(104, 114, 0xE0)
pixel(100, 112, 0xE0)
pixel(96, 110, 0xE0)
pixel(92, 108, 0xE0)
pixel(89, 106, 0xE0)

# === Center pivot ===
pixel(128, 128, 0xFF)
pixel(127, 128, 0xFF)
pixel(129, 128, 0xFF)
pixel(128, 127, 0xFF)
pixel(128, 129, 0xFF)

halt()
